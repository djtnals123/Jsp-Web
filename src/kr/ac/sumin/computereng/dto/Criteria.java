package kr.ac.sumin.computereng.dto;


public class Criteria {
    
    private int page; // 현재 페이지 번호
    private int perPage; // 페이지당 보여줄 게시글의 개수
    private String keyword;
    private String option;
    
    public int getPageStart() { // 현재 페이지 첫번째 게시글
        return (this.page -1) * perPage;
    }
 
    public Criteria(int page, int perPage, String option, String keyword) {
        this.page = page;
        this.perPage = perPage;
        this.option = option;
        this.keyword = keyword;
    }
    public Criteria(int page, int perPage) {
        this.page = page;
        this.perPage = perPage;
        this.option = null;
        this.keyword = null;
    }
 
    // 현재 페이지 번호 page : getter, setter
    public int getPage() {
        return page;
    }
 
    public void setPage(int page) {
        if(page <= 0) {
            this.page = 1;
            
        } else {
            this.page = page;
        }    
    }
 
    
    // 페이지당 보여줄 게시글의 개수 perPage : getter, setter
    public int getPerPage() {
        return perPage;
    }
 
    public void setPerPage(int perPage) {
    	this.perPage = perPage;
        
    }
    
    public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}
	
    public String getQueryString(int page) {
    	String queryString = String.format("?page=%d&per_page=%d", page, perPage);
		if(keyword != null && option != null) 
			queryString += String.format("&keyword=%s&option=%s", keyword, option);
		
		return queryString;
    }


	@Override
    public String toString() {
        return "Criteria [page=" + page + ", perPage=" + perPage + "]";
    }
}