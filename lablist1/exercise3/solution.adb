with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Interfaces;       use Interfaces;

procedure Solution is
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   function Is_Palindrome (Num : Unsigned_64) return Boolean is
      Pom     : Unsigned_64 := 0;
      Pom_Num : Unsigned_64 := Num;
   begin
      while Pom_Num > 0 loop
         Pom := Pom * 10;
         Pom := Pom + (Pom_Num mod 10);
         Pom_Num := Pom_Num / 10;
      end loop;

      return Num = Pom;
   end Is_Palindrome;

   Number : Unsigned_64;
begin
   Put ("Enter number: ");
   U64_IO.Get (Number);

   if Is_Palindrome (Number) then
      Put_Line (Unsigned_64'Image (Number) & " is a palindrome");
   else
      Put_Line (Unsigned_64'Image (Number) & " is not a palindrome");
   end if;
exception
   when Data_Error =>
      Set_Exit_Status (Failure);
end Solution;
