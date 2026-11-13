-- solution.adb
-- Maksymilian Garczyński

with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Ada.Unchecked_Deallocation;
with Interfaces;       use Interfaces;

procedure Solution is
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   type Prime_Array is array (Unsigned_64 range <>) of Unsigned_64;
   type Prime_Array_Access is access Prime_Array;

   procedure Free is new
     Ada.Unchecked_Deallocation (Prime_Array, Prime_Array_Access);

   function Nth_Prime (N : Unsigned_64) return Unsigned_64 is
      Primes      : Prime_Array_Access;
      Prime_Count : Unsigned_64 := 1;
      Number      : Unsigned_64 := 3;
      Is_Prime    : Boolean;
      Res         : Unsigned_64;
   begin
      if 0 = N then
         return 0;
      elsif 1 = N then
         return 2;
      end if;

      Primes := new Prime_Array (0 .. N - 1);
      Primes (0) := 2;

      while Prime_Count < N loop
         Is_Prime := True;

         for I in 1 .. Prime_Count - 1 loop
            if 0 = Number mod Primes (I) then
               Is_Prime := False;
               exit;
            end if;
         end loop;

         if Is_Prime then
            Primes (Prime_Count) := Number;
            Prime_Count := Prime_Count + 1;
         end if;

         Number := Number + 2;
      end loop;

      Res := Primes (Prime_Count - 1);

      Free (Primes);

      return Res;
   end Nth_Prime;

   N : Unsigned_64;
begin
   Put ("Enter n: ");
   U64_IO.Get (N);

   if N < 1 then
      Put ("Invalid n");
      Set_Exit_Status (Failure);
   else
      Put ("n-th prime number is equal ");
      U64_IO.Put (Nth_Prime (N), Width => 0);
   end if;
exception
   when Data_Error | End_Error =>
      Put ("Invalid n");
      Set_Exit_Status (Failure);
end Solution;
