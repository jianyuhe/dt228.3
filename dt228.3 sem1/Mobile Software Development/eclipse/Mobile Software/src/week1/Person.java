package week1;

public class Person{
    private String name;
    private String gender;
    
   public Person(String name, String gender)
   {
	   //this.name = name;
	   //this.gender = gender;
	   this.setName(name);
	   this.setGender(gender);
	   
   }
    public String toString()
    {
    	return "Name: " + this.getName() + " Gender: " + this.getGender().toUpperCase();
    }
	public String getName()
    {
    	return name;
    }
    
    public String getGender()
    {
    	return gender;
    }
    
    public void setName(String newName)
    {
    	name = newName;
    }
    
    public void setGender(String newGender)
    {
    	gender = newGender;
    }
	

  
}


