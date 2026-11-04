-- solution.adb
-- Maksymilian Garczynski

with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Interfaces;       use Interfaces;

procedure Solution is
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   procedure Print_Factorization (Num : Unsigned_64) is
      N        : Unsigned_64 := Num;
      D        : Unsigned_64 := 2;
      Exponent : Unsigned_64 := 0;
      First    : Boolean := True;

      procedure Print_Factor (Factor, Power : Unsigned_64) is
      begin
         if not First then
            Put ("*");
         end if;

         First := False;

         U64_IO.Put (Factor, Width => 0);
         Put ("^");
         U64_IO.Put (Power, Width => 0);
      end Print_Factor;
   begin
      U64_IO.Put (Num, Width => 0);
      Put ("=");

      while N > 1 loop
         Exponent := 0;

         while 0 = N mod D loop
            N := N / D;
            Exponent := Exponent + 1;
         end loop;

         if Exponent > 0 then
            Print_Factor (D, Exponent);
         end if;

         D := D + 1;
      end loop;

      New_Line;
   end Print_Factorization;

   Num : Unsigned_64;
begin
   Put ("Enter number: ");
   U64_IO.Get (Num);

   if Num < 2 then
      Put_Line ("Factorization is defined only for numbers greater than 1");
      Set_Exit_Status (Failure);
   else
      Print_Factorization (Num);
   end if;
exception
   when Data_Error | End_Error =>
      Set_Exit_Status (Failure);
end Solution;
