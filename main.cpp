/*
 * File:   main.cpp
 * Author: scribble
 *
 * Created on October 24, 2012, 10:14 AM
 */

#include "main.h"
#include "Point.h"

void glInit(int argc, char** argv)
{

    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowPosition(0, 0);
    glutInitWindowSize(WIDTH, HEIGHT);
    glutCreateWindow("Scribble");

    glClearColor(1.0, 1.0, 1.0, 1.0);

    glMatrixMode(GL_PROJECTION);
    gluOrtho2D(0.0, WIDTH, HEIGHT, 0.0);

    glutReshapeFunc(resize);
    glutDisplayFunc(display);
    glutKeyboardFunc(key);
    glutMouseFunc(mouse);
    glutMotionFunc(mouseCoords);
    glutIdleFunc(idle);
}

void resize(int width, int height)
{
    glViewport(0, 0, width, height);

    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

    gluOrtho2D(0.0, width, height, 0.0);

    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
}

void key(unsigned char key, int x, int y)
{
    switch ( key )
    {
        case 27:
            exit(0);
            break;
        case 'f':
            glutFullScreenToggle();
            break;
        case 'F':
            glutFullScreenToggle();
            break;
        default:
            break;
    }

    glutPostRedisplay();
}

void mouse(int button, int state, int x, int y)
{

    if ( button == GLUT_LEFT_BUTTON && state == GLUT_DOWN )
    {
        //std::cout << "down x: "<<x<< " y: "<< y <<"\n";

        if ( painter->getInterpreter()->getScribbleArea()->getScribbling() == false )
        {
            painter->getInterpreter()->screenPressEvent(new Point(x, y));

        }
    }

    if ( button == GLUT_LEFT_BUTTON && state == GLUT_UP )
    {
        //std::cout << "up x: "<<x<< " y: "<< y <<"\n";
        painter->getInterpreter()->screenReleaseEvent();

    }
    glutPostRedisplay();
}

void mouseCoords(int x, int y)
{

    if ( painter->getInterpreter()->getScribbleArea()->getScribbling() == true )
    {
        painter->getInterpreter()->screenMoveEvent(new Point(x, y));
    }
}

void idle()
{
    glutPostRedisplay();
}

void display()
{
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

    glLoadIdentity();

    painter->Draw();

    glutSwapBuffers();
    glFlush();
}

int main(int argc, char *argv[])
{

    glInit(argc, argv);

    painter = new Painter();
    inputData = new InputData(painter->getInterpreter());

    boost::thread getInput(&InputData::run, inputData);

    Sender* sender = new Sender(painter->getScribbleArea());

    painter->getInterpreter()->showLogin(1);

    glutMainLoop();
    delete sender;
    //TOCONF does this work?
    getInput.interrupt();

    return 0;
}