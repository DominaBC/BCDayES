query 50100 "Item Movements Query"
{
    QueryType = Normal;

    elements
    {
        dataitem(Item; Item)
        {
            column(No_; "No.")
            {
            }
            column(Description; Description)
            {
            }

            dataitem(Item_Ledger_Entry; "Item Ledger Entry")
            {
                DataItemLink = "Item No." = Item."No.";
                SqlJoinType = InnerJoin;

                filter(Entry_Type; "Entry Type")
                {
                }
                column(Posting_Date; "Posting Date")
                {
                }

                column(Sum_Quantity; Quantity)
                {
                    Method = Sum;
                }
            }
        }
    }
}