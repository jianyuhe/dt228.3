package week1;
public class Control {
	public static void main(String[] args)
    {
    	Person P = new Person("carl", "m");
    	
    	System.out.println("Name: " + P.getName() + " Gender: " + P.getGender());
    	System.out.println(P.toString());
    	 Student s = new Student("vi", "f");
    	 System.out.println(P instanceof Person);
    	 System.out.println(s.toString());
    }
}
