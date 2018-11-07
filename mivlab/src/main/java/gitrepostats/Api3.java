/**
 * 基于GitHub的实验教学代码。<br />
 * By 惠州学院 曾少宁
 */
package gitrepostats;



/**
 * GitHub Api路径。
 * 
 * @author zengsn
 * @since 8.0
 */
public interface Api3 {
	
	
	public static final String HTTPS = "https://";
	public static final String GIT = "api.github.com";
	public static final String LOGIN = "https://api.github.com/user";
	public static final String REPO = "/repos";

	public static final String STATE = "state=";
	public static final String STATE_CLOSED = STATE + "closed";

	public static final String PER_PAGE = "per_page=";
	public static final String PAGE = "page=";
	
	

	
}
