package com.devkim.codeBrokers.note.dto;

public class NoteDto {
	private int noteNum;
	private String senderId;
	private String receiverId;
	private String noteContent;
	private String noteDate;
	private int readStatus;
	
	public int getNoteNum() {
		return noteNum;
	}
	public void setNoteNum(int noteNum) {
		this.noteNum = noteNum;
	}
	public String getSenderId() {
		return senderId;
	}
	public void setSenderId(String senderId) {
		this.senderId = senderId;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getNoteContent() {
		return noteContent;
	}
	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}
	public String getNoteDate() {
		return noteDate;
	}
	public void setNoteDate(String noteDate) {
		this.noteDate = noteDate;
	}
	public int getReadStatus() {
		return readStatus;
	}
	public void setReadStatus(int readStatus) {
		this.readStatus = readStatus;
	}
	@Override
	public String toString() {
		return "NoteDto [noteNum=" + noteNum + ", senderId=" + senderId + ", receiverId=" + receiverId
				+ ", noteContent=" + noteContent + ", noteDate=" + noteDate + ", readStatus=" + readStatus + "]";
	}
	
}
