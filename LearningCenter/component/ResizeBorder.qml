import QtQuick 2.7

Rectangle {
    id: root
    color: "transparent"
    border.width: 1
    border.color: "red"
    width: parent.width
    height: parent.height

    property int dragSize: 5
    property var control: parent
    DragItem {
        posType: posLeftTop

        x:0;
        y:0;
        width:dragSize;
        height: dragSize;

        onPosChange: {
            //不要简化这个判断条件，至少让以后维护的人能看懂。化简过后我自己都看不懂了。
            if (control.x + xOffset < control.x + control.width)
                control.x += xOffset;
            if (control.y + yOffset < control.y + control.height)
                control.y += yOffset;
            if (control.width - xOffset > 0)
                control.width-= xOffset;
            if (control.height -yOffset > 0)
                control.height -= yOffset;
        }
    }
    DragItem {
        posType: posTop

        x: dragSize
        y: 0
        width: parent.width-2*dragSize
        height: dragSize

        onPosChange: {
            if (control.y + yOffset < control.y + control.height)
                control.y += yOffset;
            if (control.height - yOffset > 0)
                control.height -= yOffset;
        }
    }
    DragItem {
        posType: posRightTop

        x: parent.width - dragSize
        y:0;
        width:dragSize;
        height: dragSize;

        onPosChange: {
            //向左拖动时，xOffset为负数
            if (control.width + xOffset > 0)
                control.width += xOffset;
            if (control.height - yOffset > 0)
                control.height -= yOffset;
            if (control.y + yOffset < control.y + control.height)
                control.y += yOffset;
        }
    }
    DragItem {
        posType: posLeft

        x: 0
        y: dragSize;
        width:dragSize;
        height: parent.height - 2*dragSize;

        onPosChange: {
            if (control.x + xOffset < control.x + control.width)
                control.x += xOffset;
            if (control.width - xOffset > 0)
                control.width-= xOffset;
        }
    }
    DragItem {
        posType: posRight

        x: parent.width - dragSize
        y: dragSize
        width:dragSize;
        height: parent.height - 2*dragSize;

        onPosChange: {
            if (control.width + xOffset > 0)
                control.width += xOffset;
        }
    }
    DragItem {
        posType: posLeftBottom

        x: 0
        y: parent.height - dragSize
        width:dragSize;
        height: parent.height - 2*dragSize;

        onPosChange: {
            if (control.x + xOffset < control.x + control.width)
                control.x += xOffset;
            if (control.width - xOffset > 0)
                control.width-= xOffset;
            if (control.height + yOffset > 0)
                control.height += yOffset;
        }
    }
    DragItem {
        posType: posBottom

        x: dragSize
        y: parent.height - dragSize
        width:parent.width - 2*dragSize;
        height: dragSize;

        onPosChange: {
            if (control.height + yOffset > 0)
                control.height += yOffset;
        }
    }
    DragItem {
        posType: posRightBottom

        x: parent.width - dragSize
        y: parent.height - dragSize
        width: dragSize;
        height: dragSize;

        onPosChange: {
            if (control.width + xOffset > 0)
                control.width += xOffset;
            if (control.height + yOffset > 0)
                control.height += yOffset;
        }
    }
}
