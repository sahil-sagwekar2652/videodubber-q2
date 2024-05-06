from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, Column, Integer, String
from sqlalchemy.orm import sessionmaker
from sqlalchemy.ext.declarative import declarative_base

app = Flask(__name__)

with app.app_context():
	app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///database.db"
	db = SQLAlchemy(app)
	Base = declarative_base()


	class User(Base):
		__tablename__ = "users"
		id = Column(Integer, primary_key=True)
		name = Column(String)


	Base.metadata.create_all(db.engine)


	@app.route("/adduser", methods=["POST"])
	def add_user():
		data = request.get_json()

		name = data.get("name")
		user_id = data.get("id")

		# Add user to the database
		new_user = User(id=user_id, name=name)
		db.session.add(new_user)
		db.session.commit()

		# Query the database for names with ids above 5
		users_above_5 = db.session.query(User).filter(User.id > 5).all()
		names_above_5 = [user.name for user in users_above_5]

		return jsonify({"names_with_ids_above_5": names_above_5})


if __name__ == "__main__":
    app.run(debug=True)
