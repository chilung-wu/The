// SPDX-License-Identifier: MIT
// create, show


pragma solidity ^0.8.0;

contract NoteApp {
    struct Note {
        string title;
        string content;
    }

    mapping(uint256 => Note) public notes;
    uint256 public totalNotes;

    event NoteCreated(uint256 noteId, string title, string content);

    function create(string memory _title, string memory _content) external {
        uint256 noteId = totalNotes;
        notes[noteId] = Note({
            title: _title,
            content: _content
        });
        totalNotes++;

        emit NoteCreated(noteId, _title, _content);
    }

    function show(uint256 _noteId) external view returns (string memory title, string memory content) {
        require(_noteId < totalNotes, "Note does not exist");
        
        Note storage note = notes[_noteId];
        return (note.title, note.content);
    }
}