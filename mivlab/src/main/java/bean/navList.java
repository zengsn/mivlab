package bean;

import java.util.List;
public class navList {
	//总导航及内容显示的类
	private int id;
	private String name;
	private List<Snav> snav;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<Snav> getSnav() {
		return snav;
	}
	public void setSnav(List<Snav> snav) {
		this.snav = snav;
	}
	
}
