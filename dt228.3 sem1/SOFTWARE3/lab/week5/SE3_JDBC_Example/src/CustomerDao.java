import java.util.Vector;

public interface CustomerDao {
	 public Vector<Customer> selectCustomersByName(String name);
	 public Customer findCustomerById(int customerNumber);

}
