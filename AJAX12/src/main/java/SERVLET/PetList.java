package SERVLET;

public class PetList {
	private String race;
	private String size;
	private String name;
	public PetList(String r, String s, String n) {
		race = r;
		size = s;
		name = n;
	}
	
	public String getRace() {
		return race;
	}
	
	public String getSize() {
		return size;
	}
	
	public String getName() {
		return name;
	}
}
