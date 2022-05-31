CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_procedure`(IN pname long,IN price int,IN barcode long,IN quantity int)
BEGIN
if(price>0 && quantity>=0) then
insert into products(pname,price,barcode,quantity)values(pname,price,barcode,quantity);
end if;

END
