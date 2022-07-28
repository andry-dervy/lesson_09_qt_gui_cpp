import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1

Rectangle {
    id: _rootrect
    objectName: "rootrect"
    color: "gainsboro"

    //anchors.margins: 50

    property alias width_: _rootrect.width
    property alias height_: _rootrect.height

    RowLayout {
        id: _row
        anchors.top: _rootrect.top
        anchors.left: _rootrect.left
        anchors.right: _rootrect.right
        spacing: 5



        QmlButton {
            id: _addTask
            text: qsTr("Добавить задачу")
            height: 50

            Layout.fillWidth: true
            Layout.margins: 10

            onClicked: {
                //_listModel.append({})
                model_tasks.add();
                console.log(_addTask.text + " MouseAreaClicked");
            }
        }

        QmlButton {
            id: _delTask
            text: qsTr("Удалить задачу")
            height: 50

            Layout.fillWidth: true
            Layout.margins: 10

            onClicked: {
                if(_view.currentIndex !== -1)
                    model_tasks.remove(_view.currentIndex);
                console.log(_delTask.text + " MouseAreaClicked");
            }
        }
    }

    ListView {
        id: _view

        anchors.top: _row.bottom
        anchors.left: _rootrect.left
        anchors.right: _rootrect.right
        anchors.bottom: _rootrect.bottom
        anchors.margins: 5

        clip: true

        highlight: Rectangle {
            color: "skyblue"
        }
        highlightFollowsCurrentItem: true

        delegate: Item {
            id: _listItem

            property var view: ListView._view
            property var isCurrent: ListView.isCurrentItem

            width: _view.width
            height: 60

            Task {
                id: _task
                task_name: name
                task_text: description
                task_perform: progress
                task_limit_time: limitDate
                onClicked: _view.currentIndex = model.index
            }
        }

        spacing: 10

        model: model_tasks
    }
}
