public class Person implements java.io.Serializable {
   public transient long ID;

   public String name;
   public String address;
   public int number;
   
   public String toString() {
      return "[ID=" + ID + "] for person { name=" + name + ", address=" + address + ", number=" + number + " }";
   }
}
