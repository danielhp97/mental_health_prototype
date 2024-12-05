from sqlmodel import SQLModel, Field
from typing import Optional

class User(SQLModel, table=True):
    id: Optional[int] = Field(default=None, primary_key=True)
    username: str
    password: str
    name: Optional[str] = Field(default=None)
    ocupation: Optional[str] = Field(default=None)
    department: Optional[str] = Field(default=None)
