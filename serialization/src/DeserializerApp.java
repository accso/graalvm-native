import java.io.*;
public class DeserializerApp {

   public static void main(String [] args) {
      Person p = null;
      
      try {
         String fileName = "./person.ser";
         FileInputStream fileIn = new FileInputStream(fileName);
         ObjectInputStream in = new ObjectInputStream(fileIn);
         p = (Person) in.readObject();
         in.close();
         fileIn.close();

         System.out.println("Deserialized person " + p + " from file " + fileName);
      } 
      catch (IOException ioEx) {
         ioEx.printStackTrace(System.err);
      } 
      catch (ClassNotFoundException cnfEx) {
         System.out.println("Employee class not found");
         cnfEx.printStackTrace(System.err);
      }
   }
}
