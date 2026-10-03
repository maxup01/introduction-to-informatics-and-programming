with Interfaces; use Interfaces;

procedure Solution is
   procedure Is_Palindrome (Num : Unsigned_64) return Boolean is
      Pom     : Unsigned_64 := 0;
      Pom_Num : Unsigned_64 := Num;
   begin
      while Pom_Num > 0 loop
         Pom := Pom * 10;
         Pom := Pom + (Pom_Num mod 10);
         Pom_Num := Pom_Num / 10;
      end loop;

      return Num = Pom;
   end;
begin

end;
