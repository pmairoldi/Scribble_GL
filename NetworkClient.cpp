/*
 * File:   NetworkClient.cpp
 * Author: scribble
 *
 * Created on November 24, 2012, 3:51 PM
 *
 * Parts of this code has been taken from boost.org under the Boost Software License Version 1.0:
 *
 * Distributed under the Boost Software License, Version 1.0. (See accompanying
 * file LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
 */

#include "NetworkClient.h"
#include "Sender.h"

NetworkClient::NetworkClient(boost::asio::io_service& io_service, tcp::resolver::iterator endpoint_iterator) : io_service_(io_service),
socket_(io_service)
{
    tcp::endpoint endpoint = *endpoint_iterator;
    socket_.async_connect(endpoint, boost::bind(&NetworkClient::handle_connect, this, boost::asio::placeholders::error, ++endpoint_iterator));
}

//NetworkClient::NetworkClient(const NetworkClient& org)
//{
//
//    io_service_ = org.io_service_;
//    socket_ = org.socket_;
//    read_msg_ = org.read_msg_;
//    write_msgs_ = org.write_msgs_;
//}

//NetworkClient& NetworkClient::operator=( const NetworkClient &org )
//{
//    // check for self-assignment by comparing the address of the
//    // implicit object and the parameter
//    if ( this == &org )
//        return *this;
//
//    // do the copy
//    io_service_ = org.io_service_;
//    socket_ = org.socket_;
//    read_msg_ = org.read_msg_;
//    write_msgs_ = org.write_msgs_;
//
//    // return the existing object
//    return *this;
//}

void NetworkClient::write(const RequestMessage& msg)
{
    io_service_.post(boost::bind(&NetworkClient::do_write, this, msg));
}

void NetworkClient::close()
{
    io_service_.post(boost::bind(&NetworkClient::do_close, this));
}

void NetworkClient::handle_connect(const boost::system::error_code& error, tcp::resolver::iterator endpoint_iterator)
{
    if ( !error )
    {
        boost::asio::async_read(socket_, boost::asio::buffer(read_msg_.data(), RequestMessage::header_length), boost::bind(&NetworkClient::handle_read_header, this, boost::asio::placeholders::error));
    }
    else if ( endpoint_iterator != tcp::resolver::iterator() )
    {
        std::cout << "Fail connecting to server... Try again later" << std::endl;
        socket_.close();
        tcp::endpoint endpoint = *endpoint_iterator;
        socket_.async_connect(endpoint, boost::bind(&NetworkClient::handle_connect, this, boost::asio::placeholders::error, ++endpoint_iterator));
    }
}

void NetworkClient::handle_read_header(const boost::system::error_code& error)
{
    if ( !error && read_msg_.decode_header() )
    {
        boost::asio::async_read(socket_, boost::asio::buffer(read_msg_.body(), read_msg_.body_length()), boost::bind(&NetworkClient::handle_read_body, this, boost::asio::placeholders::error));
    }
    else
    {
        do_close();
    }
}

void NetworkClient::handle_read_body(const boost::system::error_code& error)
{
    if ( !error )
    {
        //TODO this is where we will analyze what we have received
        //std::cout.write(read_msg_.body(), read_msg_.body_length());
        std::string msg(read_msg_.body(), read_msg_.body_length());
        decodeRequest(msg);
        boost::asio::async_read(socket_, boost::asio::buffer(read_msg_.data(), RequestMessage::header_length), boost::bind(&NetworkClient::handle_read_header, this, boost::asio::placeholders::error));
    }
    else
    {
        do_close();
    }
}

void NetworkClient::do_write(RequestMessage msg)
{
    bool write_in_progress = !write_msgs_.empty();
    write_msgs_.push_back(msg);
    if ( !write_in_progress )
    {
        boost::asio::async_write(socket_, boost::asio::buffer(write_msgs_.front().data(), write_msgs_.front().length()), boost::bind(&NetworkClient::handle_write, this, boost::asio::placeholders::error));
    }
}

void NetworkClient::handle_write(const boost::system::error_code& error)
{
    if ( !error )
    {
        write_msgs_.pop_front();
        if ( !write_msgs_.empty() )
        {
            boost::asio::async_write(socket_, boost::asio::buffer(write_msgs_.front().data(), write_msgs_.front().length()), boost::bind(&NetworkClient::handle_write, this, boost::asio::placeholders::error));
        }
    }
    else
    {
        do_close();
    }
}

void NetworkClient::do_close()
{
    std::cout << "Socket closed" << std::endl;
    socket_.close();
}

void NetworkClient::decodeRequest(std::string msg)
{
    //Removing the leading & and the lagging \n
    std::string received(msg, 1, msg.size() - 2);
    std::cout << "Received: " << received << std::endl;

    //Separating the received message
    std::vector<std::string> info;
    boost::split(info, received, boost::is_any_of(Sender::separator));
    int choice = atoi(info[0].c_str());
    std::cout << "Choice: " << choice << std::endl;
    switch ( choice )
    {
        case Sender::REQUEST_OWNERSHIP:
        {
            //We have received a message with who is the current owner
            //TODO one I integrate this with the scribbleArea then we can set the flag that i, or some other scribble, becomes the owner
            std::cout << "REQUEST_OWNERSHIP" << std::endl;
            break;
        }
        case Sender::RELEASE_OWNERSHIP:
        {
            //File ownership is available
            //TODO one integrated with the ScribbleArea reset the ownership flag
            std::cout << "RELEASE_OWNERSHIP" << std::endl;
            break;
        }
        case Sender::NEW_PATH:
        {
            //Create new path
            std::cout << "NEW_PATH" << std::endl;
            int pathID = atoi(info[1].c_str());
            bool mode = ( info[2] == "1" ) ? true : false;
            int colorInt = atoi(info[3].c_str());
            bool active = ( info[4] == "1" ) ? true : false;
            int page = atoi(info[5].c_str());
            int width = atoi(info[6].c_str());

            int colorR = ( ( colorInt >> 16 ) & 0xFF );
            int colorG = ( ( colorInt >> 8 ) & 0xFF );
            int colorB = ( ( colorInt ) & 0xFF );

            Color color(colorR, colorG, colorB);
            Path* path = new Path(mode, color, width, pathID, active);

            //TODO once integrated with ScribbleAres, add this path to the network working path on page x

            break;
        }
        case Sender::ADD_POINTS:
        {
            //Add points to the current path
            std::cout << "ADD_POINTS" << std::endl;
            std::vector<std::string> p;
            boost::split(p, info[1], boost::is_any_of(Sender::separatorPoints));

            for ( int i = 0; i < p.size(); )
            {
                int x = atoi(p[i++].c_str());
                int y = atoi(p[i++].c_str());

                //TODO We need to create a new constructor for point that will simply take the values given and record them, without adjusting anthing
                Point* point = new Point(0, 0, x, y);
                //TODO add the created point to the working network path
            }
            break;
        }
        case Sender::END_PATH:
        {
            //End current network path
            std::cout << "END_PATH" << std::endl;
            //TODO move the network path to the real collection of paths on the given page
            break;
        }
        case Sender::UNDO:
        {
            //Undo last action, this will simply call the UNDO function of the ScribbleArea
            std::cout << "UNDO" << std::endl;
            //TODO call the undo function on the ScribbleArea
            break;
        }
        case Sender::REDO:
        {
            //TOCONF We should possibly never be here, since undo will completely remove the last action/drawing and if the user calls the redo function we will resend the whole path
            std::cout << "REDO" << std::endl;
            break;
        }
        case Sender::DELETE_PATH:
        {
            //Delete path, this will find the path to be deleted and completely remove it from the drawings
            std::cout << "DELETE_PATH" << std::endl;
            //TODO After integration with ScribbleArea find the path on page and delete it
            // alorithm:
            /*
             for(all paths on page)
                if(pathID=thisPathID)
                        remove
                        break
             */
            break;
        }
        case Sender::LOGIN:
        {
            //TOCONF not in use for now
            std::cout << "LOGIN" << std::endl;
            break;
        }
        case Sender::LOGOUT:
        {
            //TOCONF not in use for now
            std::cout << "LOGOUT" << std::endl;
            break;
        }
        case Sender::GET_FILES_LIST:
        {
            //We receive the list of all files available on the server
            std::cout << "GET_FILES_LIST" << std::endl;

            std::vector<std::string> files;
            boost::split(files, info[1], boost::is_any_of(Sender::separatorPoints));

            std::cout << "Number of files: " << files.size() << std::endl;
            for ( int i = 0; i < files.size(); i++ )
            {
                std::cout << files[i] << std::endl;
            }
            break;
        }
        case Sender::DOWNLOAD_FILE:
        {
            //TOCONF will we use this??? possible use is to let the server know what file we are working on
            std::cout << "DOWNLOAD_FILE" << std::endl;
            break;
        }
        default:
            std::cout << "Should not be here" << std::endl;

    }
}