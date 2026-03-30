import os
from crewai import Agent, Task, Crew
import snowflake.connector

# API Keys Slecting (మీ OpenAI key provide)
os.environ["OPENAI_API_KEY"] = "sk-xxxx" 

# 1. Creating Ai agent (Defining Roles)
analyst = Agent(
    role='Data Insights Expert',
    goal='Snowflake find the trends ',
    backstory='You are a Senior Data Scientist with 10 years of experience in Retail.',
    verbose=True
)

# 2. Work (Defining Tasks)
task1 = Task(
    description='Analyze the sales view and identify which category needs more marketing.',
    agent=analyst
)

# 3. Run the Code
crew = Crew(agents=[analyst], tasks=[task1])
print(crew.kickoff())
