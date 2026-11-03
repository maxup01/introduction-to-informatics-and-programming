-- solution.adb
-- Maksymilian Garczynski

with Ada.Text_IO;                       use Ada.Text_IO;
with Ada.Command_Line;                  use Ada.Command_Line;
with Interfaces;                        use Interfaces;
with Ada.Numerics.Elementary_Functions; use Ada.Numerics.Elementary_Functions;
with Ada.Numerics.Generic_Elementary_Functions;

procedure Solution is
   package FL_Math is new Ada.Numerics.Generic_Elementary_Functions (Float);
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   function Is_Prime (Num : Unsigned_64) return Boolean is
      R : Float := FL_Math.Sqrt (Float (Num));
   begin
      if Num <= 1 then
         return False;
      end if;

      for I in 2 .. Unsigned_64 (R) loop
         if Num rem I = 0 then
            return False;
         end if;
      end loop;

      return True;
   end Is_Prime;
   N : Unsigned_64 := 0;
begin
   Put ("Enter a number: ");
   U64_IO.Get (N);

   if Is_Prime (N) then
      Put ("Given number is a prime number");
   else
      Put ("Given number is not a prime number");
   end if;
end Solution;
