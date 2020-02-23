import psycopg2
import pandas as pd

def validate_user(login, password):
    return 1

try:
    conn = psycopg2.connect("dbname='caremore' user='caremore' host='localhost' password='postgres'")
except:
    print("I am unable to connect to the database")

def get_next_appointment(customer_id):
    sql = '''select c."FirstName"
            , c."LastName"
            , h."Address"
            , a."Date"
            , a."Time"
    from public."Appointment" as a inner join public."Customer" as c
            on a."CustomerID" = c."CustomerID"
            inner join public."HealthcareCenter" as h
            on a."HealthcareCenterID" = h."ID"
    where c."CustomerID" = {};'''.format(customer_id)
    df = pd.read_sql(sql, conn)
    return df

def get_perk_for_customer(customer_id):
    sql = '''select c."FirstName"
            , c."LastName"
            , p."Name" as perk
            , pa."ValidUntil"
            , pt."Name" as partner
            --, pa.* 
            --, p.*
            --, c.*
            from public."Perk_Assignment" as pa inner join public."Perk" as p
                on pa."PerkID" = p."PerkID"
                inner join public."Customer" as c
                on pa."CustomerID" = c."CustomerID"
                inner join public."Partner" as pt
                on p."PartnerID" = pt."PartnerID"
            where c."CustomerID" = {};'''.format(customer_id)
    df = pd.read_sql(sql, conn)
    return df

def create_appointment_message(next_appointment):
    message_appointment = '''Hi {}
Your Next Appointment
GP Appointment
{} 
{}
{}'''.format(next_appointment.iloc[0].FirstName
                        , next_appointment.iloc[0].Date
                        , next_appointment.iloc[0].Time
                        , next_appointment.iloc[0].Address)
    return message_appointment

def create_perk_message(perk):
    message_perk = '''This week`s bonus
{} from {}'''.format(perk.iloc[0].perk
                        , perk.iloc[0].partner)
    return message_perk

def welcome_user(user_login):
    customer_id = validate_user(user_login, "*****")
    next_appointment = get_next_appointment(customer_id)
    perk = get_perk_for_customer(customer_id)

    message_appointment = create_appointment_message(next_appointment)
    message_perk = create_perk_message(perk)
    return message_appointment, message_perk