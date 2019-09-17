
class Student extends Person implements PublishDetails{
	
	private int StudentId;
	private String CourseCode;
	//private String Name;
	//private char Gender;
	private static int studentIDCounter = 2011;
	
	Student(String Name, String Gender, String CourseCode)
	{
		super(Name, Gender);
		this.StudentId = studentIDCounter;
		studentIDCounter++;
		this.CourseCode = CourseCode;
	}
	public int StudentId()
	{
		return StudentId;
	}
	public void setStudentId(int studentid)
	{
		StudentId = studentid;
	}
	public String CourseCode()
	{
		return CourseCode;
	}
	public void CourseCode(String coursecode)
	{
		CourseCode = coursecode;
	}
	
	public String toString()
	{
		String str = super.toString() + " " + StudentId;
		return str;
	}
	
	public void confirmDeatils() {
		System.out.println(super.getName());
		
	}
	
	public void getCourseCode() {
		
		System.out.println(CourseCode);
		
	}

}
