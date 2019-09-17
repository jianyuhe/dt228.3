/**
 * 
 */

/** 
 * <!-- begin-UML-doc -->
 * <!-- end-UML-doc -->
 * @author jianyu
 * @generated "UML to Java (com.ibm.xtools.transform.uml2.java5.internal.UML2JavaTransform)"
 */
public class Library {
	
	private String bookId;
	
	private String bookTitle;
	
	public int bookStock;
	
	private Librarian librarian;
    private Student student;
	
	public void updatebooks() {
		
		if(student.borrowBook())
		{
			bookStock = bookStock - 1;
		}
		else if(student.returnBook())
		{
			bookStock = bookStock + 1;
		}
		
	}


	public Library(String bookId, String bookTitle, int bookStock) {
		this.bookId = bookId;
		this.bookTitle = bookTitle;
		this.bookStock = bookStock;
	}
	
}