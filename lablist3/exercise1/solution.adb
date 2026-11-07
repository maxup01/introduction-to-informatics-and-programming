-- solution.adb
-- Maksymilian Garczynski

with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Interfaces;       use Interfaces;

procedure Solution is
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   function Is_Prime (N : Unsigned_64) return Boolean is
      I : Unsigned_64 := 5;
   begin
      if N < 2 then
         return False;
      end if;

      if N < 4 then
         return True;
      end if;

      if 0 = N mod 2 or else 0 = N mod 3 then
         return False;
      end if;

      while I <= N / I loop
         if 0 = N mod I or else 0 = N mod (I + 2) then
            return False;
         end if;

         I := I + 6;
      end loop;

      return True;
   end Is_Prime;

   function Prime_Number_Count (N : Unsigned_64) return Unsigned_64 is
      Count : Unsigned_64 := 1;
      I     : Unsigned_64 := 3;
   begin
      if N < 2 then
         return 0;
      end if;

      while I <= N loop
         if Is_Prime (I) then
            Count := Count + 1;
         end if;

         I := I + 2;
      end loop;

      return Count;
   end Prime_Number_Count;

   Num : Unsigned_64;
begin
   Put ("Enter a number: ");
   U64_IO.Get (Num);

   New_Line;
   Put ("There are ");
   U64_IO.Put (Prime_Number_Count (Num), Width => 0);
   Put (" prime numbers from 0 to ");
   U64_IO.Put (Num, Width => 0);
exception
   when Data_Error | End_Error =>
      Set_Exit_Status (Failure);
end Solution;
