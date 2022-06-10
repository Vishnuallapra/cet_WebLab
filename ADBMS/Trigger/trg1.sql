CREATE DEFINER=`root`@`localhost` TRIGGER `company`.`update_key` AFTER INSERT ON `saleitem` FOR EACH ROW
BEGIN
   update product set qtyinstock=qtyinstock-new.qty where pid=new.pid;
END
