package kr.ac.sumin.computereng.dto;

public class AttachFile {
	private String path;
	private String originalFileName;
	private String saveFileName;
	
	public AttachFile(String path, String originalFileName, String saveFileName) {
		this.path = path;
		this.originalFileName = originalFileName;
		this.saveFileName = saveFileName;
	}
	
	public String getPath() {
		return path;
	}
	
	public String getOriginalFileName() {
		return originalFileName;
	}
	
	public String getSaveFileName() {
		return saveFileName;
	}
}
