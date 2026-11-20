namespace hotel_room;

using {
    cuid,
    managed,
    sap.common.CodeList
} from '@sap/cds/common';

@assert.unique: {hotelCode: [Code]}
entity Hotel : cuid, managed {
    Code  : String(10) @mandatory;
    Name  : String     @mandatory;
    City  : String;
    Rooms : Composition of many Room
                on Rooms.Hotel = $self;
}

@assert.unique: {roomPerHotel: [
    Hotel,
    Number
]}
entity Room : cuid, managed {
    Hotel    : Association to one Hotel @mandatory;
    Number   : String(4)                @mandatory;
    Floor    : Integer;
    PerNight : Decimal(9, 2)            @mandatory;
    Type     : Association to one RoomType;
    Status   : Association to one RoomStatus;
}

entity RoomType : CodeList {
    key Code : String(3);
}

entity RoomStatus : CodeList {
    key Code : String(3);
}
