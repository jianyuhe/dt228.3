package week1;

public class Student extends Person implements PublishDetails {

private static int studentIDCounter = 1;
	private int studentId;
	private String courseCode;
	public Student(String name, String gender) {
		super(name, gender);
		
		studentId = studentIDCounter;
		studentIDCounter++;
	}
	
	public String toString()
	{
		return ("student ID: " + studentId + super.toString());
	}
	
	public int getStudentId()
	{
		return studentId;
	}
	
	public void setStudentId(int newStudentId)
	{
	   studentId = newStudentId;
	   
	}
	@Override
	public void confirmDetails() {
		System.out.println(super.getName());
		
	}
	@Override
	public void getCourseCode() {
		System.out.print("dt228");
	}
	
	}


