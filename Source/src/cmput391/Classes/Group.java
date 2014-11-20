package cmput391.Classes;

import cmput391.OracleHandler.*;
import java.util.Date;


public class Group implements OracleInterface {
	
	private int groupId;		// primary key
	private String username;	// unique (username, groupname)
	private String groupname;
	private Date dateCreated;
	
	public Group(String username, String groupname, Date dateCreated) {
		this.groupId = 0;
		this.username = username;
		this.groupname = groupname;
		this.dateCreated = dateCreated;
	}

	// getters
	
	public int getGroupId() {
		return groupId;
	}

	public String getUsername() {
		return username;
	}

	public String getGroupname() {
		return groupname;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	// setters
	
	public void setUsername(String username) {
		this.username = username;
	}

	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	@Override
	public void create() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void retrieve() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		
	}
}
