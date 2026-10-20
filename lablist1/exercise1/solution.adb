-- solution.adb
-- Maks Garczynski

with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Interfaces;       use Interfaces;

procedure Solution is
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   function Greatest_Common_Divisor (A, B : Unsigned_64) return Unsigned_64 is
      X   : Unsigned_64 := A;
      Y   : Unsigned_64 := B;
      Pom : Unsigned_64;
   begin
      if Y > X then
         Pom := X;
         X := Y;
         Y := Pom;
      end if;

      while 0 /= X mod Y loop
         Pom := X mod Y;
         X := Y;
         Y := Pom;
      end loop;

      return Y;
   end Greatest_Common_Divisor;

   A, B : Unsigned_64;
begin
   Put ("Enter first number: ");
   U64_IO.Get (A);

   Put ("Enter second number: ");
   U64_IO.Get (B);

   Put_Line
     ("Greatest common divisor is:"
      & Unsigned_64'Image (Greatest_Common_Divisor (A, B)));
exception
   when Data_Error =>
      Set_Exit_Status (Failure);
end Solution;
