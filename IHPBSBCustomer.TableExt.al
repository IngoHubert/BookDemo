tableextension 50100 "IHP BSB Customer" extends Customer
{
    Caption = 'Customer';

    fields
    {
        field(50100; "IHP BSB Favorite Book No."; Code[20])
        {
            Caption = 'Favorite Book No.';
            NotBlank = true;
            //TODO Es darf kein gesperrtes Buch gewählt werden
            trigger OnValidate()
            var
                Book: Record 50100;

            begin
                IF Book.Get("IHP BSB Favorite Book No.") then
                    IF Book.Blocked = TRUE then
                        Error('Dieses Buch ist gesperrt');
            end;




        }

        field(50101; "IHP BSB Book Description"; Text[100])
        {
            Caption = 'Book Description';
            FieldClass = FlowField;
            Editable = false;
            //Quelltabelle und Feld, dann die Bedingung
            CalcFormula = lookup("IHP BSB Book"."Description" where("No." = field("IHP BSB Favorite Book No.")));


        }
    }


}