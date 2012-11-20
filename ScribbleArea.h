/* 
 * File:   ScribbleArea.h
 * Author: scribble
 *
 * Created on October 25, 2012, 2:17 PM
 */

#ifndef SCRIBBLEAREA_H
#define	SCRIBBLEAREA_H

#include <GL/glu.h>
#include "Color.h"
#include "Path.h"
#include "Point.h"
#include <boost/thread/mutex.hpp>
#include "Request.h"
#include "Receiver.h"
#include "Point.h"
#include "Path.h"
#include <algorithm>

class ScribbleArea
{
public:
    ScribbleArea();
    ScribbleArea(const ScribbleArea& orig);
    virtual ~ScribbleArea();
    void Draw();

    Color getPenColor();
    float getPenSize();
    void setPenColor(Color &newColor);
    void setPenWidth(int newWidth);
    
    void screenPressEvent(Point* point);
    void screenMoveEvent(Point* point);
    void screenReleaseEvent(/*Points *point*/);

    //void nextPage();
    //void previousPage();
    void undo();
    void redo();
    void write();
    void erase();
    void clearAll();

    int getMode();
    std::vector<std::vector<Path*> > getPathsOnPage();
    int getCurrentPage();
    void setLockForPath(bool lock);
    Path* getTempPath();
    
private:
    
    void cleanRedoVector();
    void cleanPathsOnCurentPageVector();
    
    enum modes
    {
        WRITE, ERASE, MENU_PRESS, LOAD, SAVE_AS, COLOUR, SIZE_WRITE, SIZE_ERASE
    };

    enum
    {
        MENU_BUTTON_H = 40,
        MENU_BUTTON_W = 47,
        MENU_BUTTON_SPACING = 17
    };
    
    Color penColor;
    float penSize;

    int mMode;
    bool scribbling;

    std::vector<int> Paths_IDs;
    Path *mTempPath;

    Point lastPoint;

    boost::mutex pathsLock;
    boost::mutex lockForTempPath;
    boost::mutex lockForNetworkPath;

    int currentPage;
    std::vector<std::vector<Path*> > pathsOnPage;
    std::vector< std::vector<Path*> > redoVector;

    /***********************************
     *****Used for networking***********
     **********************************/

    void SendTests();
    void NetworkRequestsAnalyzer();

    bool checkMyRequests;
    int nextRequestID;

    typedef std::vector <Request*> Vector_Request;
    Vector_Request *mRequests;
    
    
    //The 2 below structures will point to the same Path at all times
    //Used for rendering
    //std::vector<Path* > pathOnPageNetwork;
    //Used for easier access 
    Path* myNetworkPath;
    int myNetworkPathPage;
    
    
    Receiver* receiver;
    boost::mutex *requestsMutex;
    Sender * mySender;
    std::string username;
    std::string password;
    int serverListeningPort;
    
    std::string fileOwner;
};

#endif	/* SCRIBBLEAREA_H */

