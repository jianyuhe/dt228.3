/**
 * 
 */

/** 
 * <!-- begin-UML-doc -->
 * <!-- end-UML-doc -->
 * @author jianyu
 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Librarian {
	
	private String librarianId;
	
	private String librarianName;
	
	private boolean isStudent = false;
	
	private Student student;
	
	private Library library;

	public boolean isStudent()
	{
		return isStudent;
	}
	
	public void checkStudentId() {
		
		if(student.getStudentId() == "D123")
		{
			isStudent = true;
		}
		else
		{
			System.out.println("student ID is wrong, can not borrow or return books");
		}
	}

	
	public Librarian(String librarianId, String librarianName) {
		this.librarianId = librarianId;
		this.librarianName = librarianName;
	}
}