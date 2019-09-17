
public class Control {
	
	public static void main(String[] args) {
		
		Person Peter = new Person("Peter", "m");
		Person Carl = new Person("Carl", "m");
		Student Jim = new Student("Jim", "m", "DT3202");
		Student Lan = new Student("Lan", "m", "DT3202");
		
		System.out.println(Peter.getName());
		System.out.println(Carl.getName());
		System.out.println(Peter.toString());
		System.out.println(Jim.toString());
		Jim.confirmDeatils();
		Jim.getCourseCode();
		System.out.println(Jim instanceof Student);
		System.out.println(Lan.toString());
		System.out.println(Jim instanceof PublishDetails);
	}

}
interface PublishDetails{
	
	public void confirmDeatils();
	public void getCourseCode();
}
