/*	JASON JAMES POLLMAN
	4/9/2013
	ITCS-3160-001
*/

CREATE TABLE AIRPORT (			Airport_code	int				NOT NULL,
								City			varchar(50)		NOT NULL,
								[State]			char(2)			NOT NULL,
								Name			varchar(50)		NOT NULL,
								CONSTRAINT PK_Airport PRIMARY KEY CLUSTERED (Airport_code))
GO


CREATE TABLE AIRPLANE_TYPE (	[Type_name]			varchar(50)		NOT NULL,
								Max_seats			varchar(50)		NOT NULL,
								Company				varchar(20)		NOT NULL,
								CONSTRAINT PK_Airplane_Type PRIMARY KEY CLUSTERED ([Type_name]))
GO


CREATE TABLE AIRPLANE (			Airplane_id			int				NOT NULL,
								Total_no_of_seats	int				NOT NULL,
								Airplane_Type		varchar(50)		NOT NULL,
								CONSTRAINT PK_Airplane PRIMARY KEY CLUSTERED (Airplane_id),
								CONSTRAINT FK_Airplane_Airplane_Type FOREIGN KEY(Airplane_Type) REFERENCES AIRPLANE_TYPE([Type_name]) ON DELETE NO ACTION ON UPDATE CASCADE)
GO


CREATE TABLE FLIGHT (			Number				int				NOT NULL,
								Airline				varchar(50)		NOT NULL,
								Weekdays			varchar(9)		NOT NULL,
								CONSTRAINT PK_Flight PRIMARY KEY CLUSTERED (Number))
GO


CREATE TABLE FARE (				Code				int				NOT NULL,
								Amount				money			NOT NULL,
								Restrictions		varchar(150)	NOT NULL,
								Flight_Number		int				NOT NULL,
								CONSTRAINT PK_Fare PRIMARY KEY CLUSTERED (Code, Flight_Number),
								CONSTRAINT FK_Fare_Flight_Number FOREIGN KEY(Flight_Number) REFERENCES FLIGHT(Number) ON DELETE CASCADE ON UPDATE CASCADE)
GO


CREATE TABLE FLIGHT_LEG	(		Leg_no				int				NOT NULL,
								Flight_Number		int				NOT NULL,
								Dep_Airport_code	int				NOT NULL,
								Arr_Airport_code	int				NOT NULL,
								Scheduled_dep_time	time			NOT NULL,
								Scheduled_arr_time	time			NOT NULL,
								CONSTRAINT PK_Flight_Leg PRIMARY KEY CLUSTERED (Leg_no, Flight_Number),
								CONSTRAINT FK_Flight_Leg_Flight_Number FOREIGN KEY(Flight_Number) REFERENCES FLIGHT(Number) ON DELETE CASCADE ON UPDATE CASCADE,
								CONSTRAINT FK_Flight_Leg_Dep_Airport FOREIGN KEY(Dep_Airport_code) REFERENCES AIRPORT(Airport_code) ON DELETE NO ACTION ON UPDATE NO ACTION,
								CONSTRAINT FK_Flight_Leg_Arr_Airport FOREIGN KEY(Arr_Airport_code) REFERENCES AIRPORT(Airport_code) ON DELETE NO ACTION ON UPDATE NO ACTION)
GO


CREATE TABLE LEG_INSTANCE (		[Date]				date			NOT NULL,
								No_of_avail_seats	int				NOT NULL,
								Leg_no				int				NOT NULL,
								Flight_Number		int				NOT NULL,
								Airplane_id			int				NOT NULL,
								Airport_code		int,
								Dep_time			time,
								Arr_time			time,
								CONSTRAINT PK_Leg_Instance PRIMARY KEY CLUSTERED ([Date], Leg_no),
								CONSTRAINT FK_Leg_Instance_Flight_Leg FOREIGN KEY(Leg_no, Flight_Number) REFERENCES FLIGHT_LEG(Leg_no, Flight_Number) ON DELETE CASCADE ON UPDATE CASCADE,
								CONSTRAINT FK_Leg_Instance_Airplane_id FOREIGN KEY(Airplane_id) REFERENCES AIRPLANE(Airplane_id) ON DELETE NO ACTION ON UPDATE CASCADE,
								CONSTRAINT FK_Leg_Instance_Airport_code FOREIGN KEY(Airport_code) REFERENCES AIRPORT(Airport_code) ON DELETE NO ACTION ON UPDATE CASCADE)
GO
								

CREATE TABLE SEAT (				Seat_no				int				NOT NULL,
								Leg_Inst_Date		date			NOT NULL,
								Leg_no				int				NOT NULL,
								Customer_name		varchar(150)	NOT NULL,
								Cphone				char(12)		NOT NULL,
								CONSTRAINT PK_Seat PRIMARY KEY CLUSTERED (Seat_no, Leg_Inst_Date),
								CONSTRAINT FK_Seat_Leg_Instance FOREIGN KEY(Leg_Inst_Date, Leg_no) REFERENCES LEG_INSTANCE([Date], Leg_no) ON DELETE CASCADE ON UPDATE CASCADE)
GO


CREATE TABLE CAN_LAND (			Airport				int				NOT NULL,
								Airplane_type		varchar(50)		NOT NULL,
								CONSTRAINT PK_Can_Land PRIMARY KEY CLUSTERED (Airport, Airplane_Type),
								CONSTRAINT FK_Can_Land_Airport FOREIGN KEY(Airport) REFERENCES AIRPORT(Airport_code) ON DELETE CASCADE ON UPDATE CASCADE,
								CONSTRAINT FK_Can_Land_Airplane_type FOREIGN KEY(Airplane_type) REFERENCES AIRPLANE_TYPE([Type_name]) ON DELETE CASCADE ON UPDATE CASCADE)
GO
											



