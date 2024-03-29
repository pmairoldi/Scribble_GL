/*!
 * File:   Path.h
 * Author: greg
 *
 * Created on March 3, 2012, 11:55 AM
 */

#ifndef PATH_H
#define	PATH_H

#include <vector>
#include "Point.h"
#include "Color.h"
#include "defines.h"
#include "ScreenAreas.h"

#include <iostream>

class Path
{
public:
    Path(Point* point, int mode, Color color, int width, int ID, bool _final=false/*, bool active = true*/);
    Path(int mode, Color color, int width, int ID);//, bool active);
    Path(const Path& orig);
    virtual ~Path();
    void addPoint(Point* point);
    std::vector<Point*> getPath();
    std::vector<float> getPointPath();
    int getPenWidth();
    Color getPenColor() const;
     int getPenColorInt();
    int getMode() const;
    void setEraseMode();
    void setWriteMode();

    int getPathID() const;
    void disablePath();
    void enablePath();
    bool isEnabled() const;

    int getLength();
    ScreenAreas* getArea();

    void setPenColor(Color color);

    int getPointsCount();

private:
    int sqrt(const int x);

    int WriteEraseMode;
    int myPenWidth;
    Color myPenColor;
    std::vector<Point *> mPointsVector;
    std::vector<float> pointsVector;
    int ID;
    bool active;
    /*! Used to determine if the path is really what the user wanted to write or not*/
    bool _final;
    int totalLength;
    int mX;
    int mY;

    ScreenAreas *area;

    enum mode
    {
        WRITE, ERASE
    };
};

#endif	/* PATH_H */

