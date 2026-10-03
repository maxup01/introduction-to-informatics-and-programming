with Ada.Text_IO; use Ada.Text_IO;
with Interfaces;  use Interfaces;

procedure Solution is
   function From_C_To_Dec (Base, Num : Unsigned_64) return Unsigned_64 is
      N   : Unsigned_64 := Num;
      P   : Unsigned_64 := 1;
      Dec : Unsigned_64 := 0;
   begin
      while N > 0 loop
         Dec := Dec + P * (N mod 10);
         N := N / 10;
         P := P * Base;
      end loop;

      return Dec;
   end From_C_To_Dec;

   function From_Hex_To_Dec (Hex : String) return Unsigned_64 is
      P   : Unsigned_64 := 1;
      Dec : Unsigned_64 := 0;
   begin
      for I in reverse Hex'Range loop
         if Hex (I) >= 'A' then
            Dec :=
              Dec
              + Unsigned_64
                  (Character'Pos (Hex (I)) - Character'Pos ('A') + 10)
                * P;
         else
            Dec :=
              Dec
              + Unsigned_64 (Character'Pos (Hex (I)) - Character'Pos ('0'))
                * P;
         end if;

         P := P * 16;
      end loop;

      return Dec;
   end From_Hex_To_Dec;
begin
   Put_Line (Unsigned_64'Image (From_C_To_Dec (2, 101010)));
   Put_Line (Unsigned_64'Image (From_C_To_Dec (8, 1357)));
   Put_Line (Unsigned_64'Image (From_Hex_To_Dec ("DEAD")));
   Put_Line (Unsigned_64'Image (From_Hex_To_Dec ("BEAF")));
end;
