import java.io.*;
public class SerializerApp {

   public static void main(String [] args) {
      Person p = new Person();
      p.name = "Bob";
      p.address = "In the Woods";
      p.ID = 123L;
      p.number = 456;
      
      try {
         String fileName = "./person.ser";
         FileOutputStream fileOut = new FileOutputStream(fileName);
         ObjectOutputStream out = new ObjectOutputStream(fileOut);

         out.writeObject(p);
         out.close();
         fileOut.close();

         System.out.println("Serialized data for Person " + p + " is saved to file " + fileName);
      } catch (IOException ioEx) {
         ioEx.printStackTrace(System.err);
      }
   }
}
