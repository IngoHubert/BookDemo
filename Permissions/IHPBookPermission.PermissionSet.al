permissionset 50100 "IHP Book Permission"
{
    Caption = 'Show and Edit of Books';
    Assignable = true;
    Permissions = table "IHP BSB Book" = X,
        tabledata "IHP BSB Book" = RIMD;
}