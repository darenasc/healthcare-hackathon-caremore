INSERT INTO public."Customer"(
	"CustomerID", "FirstName", "LastName", "Birthdate", "Gender", "CustomerLogin", "CustomerPassword")
	VALUES (1, 'PersonName', 'PersonLastName', '1990-01-01', 'Male', 'pperson', '****');

INSERT INTO public."HealthcareCenter"(
	"ID", "Name", "Address", "Latitude", "Longitude", "PostalCode", "ContactPhone", "ContactEmail")
	VALUES (1, 'Crags Healthcare Center', '10 Bowmont Pl Edinburgh', 55.944772, -3.179681, 'EH8 9RY', '440750000000', 'healthcare@crags.org');

INSERT INTO public."Appointment"(
	"ID", "CustomerID", "HealthcareCenterID", "Time", "Date")
	VALUES (1, 1, 1, '04:15 PM', '2020-02-24');

INSERT INTO public."Perk_Assignment"(
	"PerkID", "CustomerID", "AddedDate", "PerkAssignmentID")
	VALUES (1, 1, '2020-02-22', 1);

INSERT INTO public."Perk"(
	"PerkID", "Name", "PerkType", "PartnerID", "Quantity", "Units")
	VALUES (1, 'Sausage Roll', 'Food', 1, 1, 1);

INSERT INTO public."Partner"(
	"PartnerID", "Name", "Address", "PostalCode")
	VALUES (1, 'Greggs', 'Edinburgh', 'EH8 9PP');