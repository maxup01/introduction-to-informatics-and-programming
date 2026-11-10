-- solution.adb
-- Maksymilian Garczyński

with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Command_Line; use Ada.Command_Line;
with Interfaces;       use Interfaces;

procedure Solution is
   package U64_IO is new Ada.Text_IO.Modular_IO (Unsigned_64);

   function Binomial (N : Unsigned_64; K : Unsigned_64) return Unsigned_64 is
      Res   : Unsigned_64 := 0;
      I     : Unsigned_64 := 1;
      K_Pom : Unsigned_64 := K;
   begin
      if K > N then
         return Res;
      end if;

      if K_Pom > N - K_Pom then
         K_Pom := N - K_Pom;
      end if;

      Res := 1;

      while I <= K_Pom loop
         Res := Res * (N - K_Pom + I) / I;
         I := I + 1;
      end loop;

      return Res;
   end;

   N   : Unsigned_64 := 0;
   K   : Unsigned_64 := 0;
   Res : Unsigned_64 := 0;
begin
   Put_Line ("Enter n: ");
   U64_IO.Get (N);

   Put_Line ("Enter k: ");
   U64_IO.Get (K);

   Res := Binomial (N, K);

   if Res = 0 then
      Put_Line ("Invalid inputs");
   else
      Put_Line
        ("Binomial of n = "
         & Unsigned_64'Image (N)
         & " and k = "
         & Unsigned_64'Image (K)
         & "is equal to "
         & Unsigned_64'Image (Res));
   end if;
exception
   when Data_Error | End_Error =>
      Set_Exit_Status (Failure);
end Solution;
