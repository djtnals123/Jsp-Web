package kr.ac.sumin.computereng.dto;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BoardVO {
	private int no;
	private String title;
	private String writer;
	private String contents;
	private Date createDate;
	private AttachFile attachFile;
	
	public BoardVO(int no, String title, String writer, String contents, Date createDate, AttachFile attachFile) {
		this.no=no;
		this.title=title;
		this.contents=contents;
		this.writer=writer;
		this.createDate=createDate;
		this.attachFile=attachFile;
	}
	

	public String getFormatDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("YYYY-MM-dd");
		return simpleDateFormat.format(this.createDate);
	}
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public AttachFile getAttachFile() {
		return attachFile;
	}
	public void setAttachFile(AttachFile attachFile) {
		this.attachFile=attachFile;
	}
	
}
