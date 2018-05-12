package teachingSys.been;

import java.util.List;

public class Otitle
{
	private  int id;
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	private  String otname;
	public String getOtname(){
		return otname;
	}
	public void setOtname(String otname){
		this.otname=otname;
	}
	private List<Ttitle> ttlist;
	public List<Ttitle> getTtlist() {
		return ttlist;
	}
	public void setTtlist(List<Ttitle> ttlist) {
		this.ttlist = ttlist;
	}
}