package bean;

public class indexContent {
	private String imgPath,title,footer_name,footer_Addr;	//indexShow.jsp中 的站点logo，站点标题，脚注（单位名称，单位地址）
	private String bgColor,wordColor,logoPath;
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFooter_name() {
		return footer_name;
	}

	public void setFooter_name(String footer_name) {
		this.footer_name = footer_name;
	}

	public String getFooter_Addr() {
		return footer_Addr;
	}

	public void setFooter_Addr(String footer_Addr) {
		this.footer_Addr = footer_Addr;
	}
		
	public String getBgColor() {
		return bgColor;
	}

	public void setBgColor(String bgColor) {
		this.bgColor = bgColor;
	}

	public String getWordColor() {
		return wordColor;
	}

	public void setWordColor(String wordColor) {
		this.wordColor = wordColor;
	}
	public String getLogoPath() {
		return logoPath;
	}
	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}


	
}
