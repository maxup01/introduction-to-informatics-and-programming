-- solution.adb
-- Maksymilian Garczynski

with Ada.Text_IO;       use Ada.Text_IO;
with Ada.Command_Line;  use Ada.Command_Line;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Solution is
   procedure Solve_Quadratic_Equation (A, B, C : Float) is
      Delta_Value : Float := B * B - 4.0 * A * C;
   begin
      Put_Line
        (Float'Image (A)
         & " * x^2 + "
         & Float'Image (B)
         & " * x + "
         & Float'Image (C)
         & " = 0");

      if Delta_Value < 0.0 then
         Put_Line ("Equation has no solution");
      elsif 0.0 = Delta_Value then
         Put_Line ("x = " & Float'Image (-B) & " / " & Float'Image (2.0 * A));
      else
         Put_Line
           ("x1 = ("
            & Float'Image (-B)
            & " - √"
            & Float'Image (Delta_Value)
            & ") / "
            & Float'Image (2.0 * A));
         Put_Line
           ("x2 = ("
            & Float'Image (-B)
            & " + √"
            & Float'Image (Delta_Value)
            & ") / "
            & Float'Image (2.0 * A));
      end if;
   end Solve_Quadratic_Equation;

   A, B, C : Float;
begin
   Put ("Enter a: ");
   Get (A);

   Put ("Enter b: ");
   Get (B);

   Put ("Enter c: ");
   Get (C);

   Solve_Quadratic_Equation (A, B, C);
exception
   when Data_Error =>
      Set_Exit_Status (Failure);
end Solution;
