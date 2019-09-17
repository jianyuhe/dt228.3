
public class Person {
	private String Name;
	private String Gender;
	
	Person (String Name, String Gender) 
	{
		this.setName(Name);
		this.Gender = Gender.toUpperCase();
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}
	
	public String getGender()
	{
		return Gender;
	}
	public void setGender(String gender)
	{
		 Gender = gender;
	}
	public String toString()
	{
		String str = Name + " " + Gender;
		return str;
	}

}

