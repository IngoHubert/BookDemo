table 50100 "IHP BSB Book"
{
    Caption = 'Book';
    DataClassification = ToBeClassified;




    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            NotBlank = true;

        }

        field(2; Description; Text[100])
        {
            Caption = 'Description';
            trigger OnValidate()
            begin
                "Search Description" := Description;
            end;
        }

        field(3; "Search Description"; Code[100])
        {
            Caption = 'Search Description';
            //TODO Standard Implementation              
        }

        field(4; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }

        field(5; Type; Option)
        {
            Caption = 'Type';
            OptionMembers = " ",Hardcover,Paperback;
            OptionCaption = ' ,Hardcover,Paperback';
        }

        field(7; Created; Date)
        {
            Caption = 'Created';
            Editable = false;
            //TODO automatisch setzen
        }

        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
            //TODO automatisch setzen
        }

        field(10; Author; Text[50])
        {
            Caption = 'Author';
        }

        field(11; "Author Provision %"; Decimal)
        {
            Caption = 'Author Provision %';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            MaxValue = 100;
        }

        field(15; ISBN; Code[20])
        {
            Caption = 'ISBN';
        }
        field(16; "No. of Pages"; Integer)
        {
            Caption = 'No. of Pager';
            MinValue = 0;
        }

        field(17; "Edition No."; Integer)
        {
            Caption = 'Edition No.';
            MinValue = 0;
        }

        field(18; "Date of Publishing"; Date)
        {
            Caption = 'Date of Publishing';
        }
    }


    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger
    OnInsert()
    begin
        Created := Today;
    end;

    trigger
    OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger
    OnDelete()
    begin
        Error('Löschen ist nicht zulässig.');
    end;



    //TODO löschen sperren
    //TODO Überprüfung bei Blocked=true
}