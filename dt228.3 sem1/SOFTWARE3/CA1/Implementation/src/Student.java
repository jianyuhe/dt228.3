/**
 * 
 */

/** 
 * <!-- begin-UML-doc -->
 * <!-- end-UML-doc -->
 * @author jianyu
 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Student {

	public String studentId;
	
	private String studentName;
    private boolean borrow = false;
    private boolean returned = false;
	private Librarian librarian;
	private Library library;

	
	public boolean borrowBook() {
		if(librarian.isStudent() == true && library.bookStock != 0 )
		{
			borrow = true;
		}
		if(library.bookStock == 0)
		{
			System.out.println("no stock for this book");
		}
		
		return borrow;
	}

	
	public boolean returnBook() {
		if(librarian.isStudent() == true)
		{
			returned = true;
		}
		return returned;
	}

	
	public Student(String studentId, String studentName) {
		this.studentId = studentId;
		this.studentName = studentName;
	}


	public String getStudentId() {
		return studentId;
	}

}