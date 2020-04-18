//
// Copyright (C) 2020~2020 by CSSlayer
// wengxt@gmail.com
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2, or (at your option)
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14
import QtQuick.Dialogs 1.1 as QtDialogs

Button {
    property variant rawValue
    property bool needsSave: text != rawValue

    icon.name: "document-edit"
    text: kcm.fontToString(fontDialog.font)
    onClicked: fontDialog.open()

    ToolTip {
        visible: parent.hovered
        text: i18n("Select Font...")
    }

    QtDialogs.FontDialog {
        id: fontDialog
        title: i18nc("@title:window", "Select Font")
    }

    Component.onCompleted: {
        load(rawValue)
    }

    function load(rawValue) {
        fontDialog.font = kcm.parseFont(rawValue)
    }

    function save() {
        rawValue = text
    }
}