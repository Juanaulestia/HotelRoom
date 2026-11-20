using {hotel_room as rooms} from '../db/schema.cds';

define service InventoryService {

    entity Hotel        as projection on rooms.Hotel;
    entity Room         as projection on rooms.Room;

    @readonly
    entity RoomType    as projection on rooms.RoomType;

    @readonly
    entity RoomStatus as projection on rooms.RoomStatus;

}
