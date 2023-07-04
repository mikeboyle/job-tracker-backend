INSERT INTO companys (id, name)
VALUES
  ('037700c8-4578-4eaf-bdf6-843a447ceb22', 'Google'),
  ('e6759489-b21d-4714-b520-a530f33c7bfd', 'Apple'),
  ('e3f39560-3c4e-4acf-a863-c288be772e13', 'Meta'),
  ('6d58e2b1-c38e-4d23-ad36-f7eeae323a19', 'Netflix'),
  ('e7bc6ab0-50ff-42d0-ba76-adbd43ddc7c6', 'Amazon'),
  ('ce8b27c7-c9ec-484e-ab30-09a583c628fa', 'Pursuit');

INSERT INTO locations (id, name)
VALUES 
  ('283ac0d6-62d2-4c25-9364-ac2d6638d8de', 'remote'),
  ('3d7b6fd3-0210-4869-923d-f0d0c5ff0153', 'New York City'),
  ('21b68d75-d003-46d2-8d7b-5db9a253f446', 'Dallas'),
  ('7b50d012-5ea0-45ae-a4b1-d4c86bc9f70b', 'New Jersey'),
  ('7570f44d-dfad-4a83-a36c-568305b2b94d', 'San Francisco'),
  ('58ee975e-2de9-4bad-8caa-5b4153b7c743', 'Chicago');

INSERT INTO users (id, email)
VALUES
  ('70be120e-0707-4488-a980-0ce98a910817', 'mikeboyle@pursuit.org'),
  ('6a730847-3bed-4051-9fbf-215eddd3bcc8', 'userA@pursuit.org'),
  ('2e9e7434-a39d-48e9-849a-eb5809169f4c', 'userB@pursuit.org'),
  ('5677146f-cae5-4d2d-acde-6ace4431186c', 'userC@pursuit.org'),
  ('bef45247-e990-4ad5-9c32-2e8eb0611841', 'userD@pursuit.org');

INSERT INTO job_statuses (id, status)
VALUES
  ('7cd9e36e-7119-42a1-8065-018692f04914', 'open'),
  ('4b3cbd82-2e97-4e75-8c7d-a3bbf346fbc2', 'closed'),
  ('b2990fc8-ddc3-4323-aa72-eb367a3a968f', 'filled'),
  ('7b3c8491-cee3-489b-8407-66ef5ea8eae0', 'canceled'),
  ('14427bed-96c9-49ac-a108-2dbd6dcd6a2e', 'other');

INSERT INTO application_statuses (id, status)
VALUES
  ('ffb2727a-f2cb-4602-98c0-2db09be7c355', 'not_started'),
  ('a42da525-33a5-4961-baa1-79c06cd0a173', 'started'),
  ('bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6', 'submitted'),
  ('38d0d734-e093-43f0-ab98-2ee6e4fd5e79', 'rejected'),
  ('42faf919-8991-4e8e-81ff-dc90dcfe59a3', 'recruiter_screen'),
  ('d2c93f57-74ac-428d-b07a-eb8f6756eb7f', 'tech_screen'),
  ('f610b0bc-f4f4-4680-951f-8a53d472865b', 'onsite'),
  ('60bdb5b1-fdaf-4684-85a4-77ffe05529d8', 'received_offer'),
  ('6144499f-d1ca-413e-a8aa-9456cc6fa344', 'accepted_offer');

INSERT INTO jobs (id, company_id, description, job_status_id)
VALUES
  ('8303379e-edd5-407d-845e-b963179f9f3a', '037700c8-4578-4eaf-bdf6-843a447ceb22', 'L1 SWE', '7cd9e36e-7119-42a1-8065-018692f04914'),
  ('2ab6d576-c098-402b-9025-7bcb71610b22', '037700c8-4578-4eaf-bdf6-843a447ceb22', 'Support Engineer', '4b3cbd82-2e97-4e75-8c7d-a3bbf346fbc2'),
  ('c25f3db2-371e-4155-bc95-d4b4994a50e0', 'e6759489-b21d-4714-b520-a530f33c7bfd', 'Engineer for Siri', '7cd9e36e-7119-42a1-8065-018692f04914'),
  ('61588de0-230a-4c78-b4f0-8c027c882dec', 'e6759489-b21d-4714-b520-a530f33c7bfd', 'ios developer', '7cd9e36e-7119-42a1-8065-018692f04914'),
  ('2f0cea47-332d-41f4-8d41-0d164db6bea2', 'ce8b27c7-c9ec-484e-ab30-09a583c628fa', 'Employment instructor', '4b3cbd82-2e97-4e75-8c7d-a3bbf346fbc2'),
  ('0da4d653-fa68-474d-b4a1-f2423d5ce1ba', 'ce8b27c7-c9ec-484e-ab30-09a583c628fa', 'Part-time tutor', '7cd9e36e-7119-42a1-8065-018692f04914'),
  ('f4b1ecd8-c742-4270-8b0f-5d10a3f32aa8', '6d58e2b1-c38e-4d23-ad36-f7eeae323a19', 'Site reliabilty engineer', 'b2990fc8-ddc3-4323-aa72-eb367a3a968f'),
  ('26388962-acc2-45fb-beb5-a175a480574a', '6d58e2b1-c38e-4d23-ad36-f7eeae323a19', 'Back end developer', '7b3c8491-cee3-489b-8407-66ef5ea8eae0'),
  ('99b73f6e-26af-40e3-aebb-e177f1733fd1', 'e7bc6ab0-50ff-42d0-ba76-adbd43ddc7c6', 'Machine learning engineer', '7cd9e36e-7119-42a1-8065-018692f04914'),
  ('e21932d5-6158-4153-ac20-aa719adeb4f8', 'e3f39560-3c4e-4acf-a863-c288be772e13', 'Metaverse explorer', '7cd9e36e-7119-42a1-8065-018692f04914');

INSERT INTO job_locations (id, job_id, location_id)
VALUES
  ('ae4a0ddd-c3f8-489d-aaf6-dec6427d592a', '8303379e-edd5-407d-845e-b963179f9f3a', '283ac0d6-62d2-4c25-9364-ac2d6638d8de'), --Google L1 SWE, remote
  ('836bd0e0-d59f-445c-bf40-bd0f940f4469', '8303379e-edd5-407d-845e-b963179f9f3a', '3d7b6fd3-0210-4869-923d-f0d0c5ff0153'), --Google L1 SWE, New York City
  ('fbe9d1ba-c1ce-4e36-b643-7e04b7f4aa7e', '2ab6d576-c098-402b-9025-7bcb71610b22', '3d7b6fd3-0210-4869-923d-f0d0c5ff0153'), --Google support, New York City
  ('6ace3357-c390-42f8-b3a4-746480094aff', 'c25f3db2-371e-4155-bc95-d4b4994a50e0', '7570f44d-dfad-4a83-a36c-568305b2b94d'), --Apple Siri, San Francisco
  ('5ed3971c-0d13-4e99-9b11-acc655c247c1', '61588de0-230a-4c78-b4f0-8c027c882dec', '283ac0d6-62d2-4c25-9364-ac2d6638d8de'), --Apple ios, remote
  ('69969e31-15d0-49b2-bc7b-c9294fc35e46', '2f0cea47-332d-41f4-8d41-0d164db6bea2', '283ac0d6-62d2-4c25-9364-ac2d6638d8de'), --Pursuit employment, remote
  ('4837e6e8-fda0-494b-a41c-6dc7f40752f7', '0da4d653-fa68-474d-b4a1-f2423d5ce1ba', '3d7b6fd3-0210-4869-923d-f0d0c5ff0153'), --Pursuit Part-time tutor, New York City
  ('e786fc12-d3d8-4d44-9e18-38b4420ac0f5', 'f4b1ecd8-c742-4270-8b0f-5d10a3f32aa8', '58ee975e-2de9-4bad-8caa-5b4153b7c743'), --site reliability, Chicago
  ('89cd0014-d2c2-4560-b74e-5a62ed8f41b0', 'f4b1ecd8-c742-4270-8b0f-5d10a3f32aa8', '21b68d75-d003-46d2-8d7b-5db9a253f446'), --site reliability, Dallas
  ('9b55a75f-b81b-4dcb-b07a-acecabfc9abb', '26388962-acc2-45fb-beb5-a175a480574a', '7b50d012-5ea0-45ae-a4b1-d4c86bc9f70b'), --Back end, New Jersey
  ('ede04804-655a-4053-9f31-e5163471deb5', '99b73f6e-26af-40e3-aebb-e177f1733fd1', '7570f44d-dfad-4a83-a36c-568305b2b94d'), -- ML, San Franciso
  ('a05f8973-93d5-4908-b669-7b3bda2740a7', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '283ac0d6-62d2-4c25-9364-ac2d6638d8de'); --Metaverse, remote

INSERT INTO applications (id, job_id, user_id, application_status_id)
VALUES
  ('f94e5728-4311-40bd-8ba2-122e2beb9e5c', '8303379e-edd5-407d-845e-b963179f9f3a', '6a730847-3bed-4051-9fbf-215eddd3bcc8', 'ffb2727a-f2cb-4602-98c0-2db09be7c355'),--Google SWE, userA, not_started
  ('44198feb-41a4-4049-a89c-f1637b5c60cf', '8303379e-edd5-407d-845e-b963179f9f3a', '2e9e7434-a39d-48e9-849a-eb5809169f4c', 'a42da525-33a5-4961-baa1-79c06cd0a173'),--Google SWE, userB, started
  ('d9e7e287-f065-4479-acda-d9353f0a1f61', '8303379e-edd5-407d-845e-b963179f9f3a', '5677146f-cae5-4d2d-acde-6ace4431186c', 'bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6'),--Google SWE, userC, submitted
  ('508c1b59-22c9-4b21-bd33-08883f32969e', '2ab6d576-c098-402b-9025-7bcb71610b22', '70be120e-0707-4488-a980-0ce98a910817', '38d0d734-e093-43f0-ab98-2ee6e4fd5e79'),--Google Support, mike, rejected
  ('cc331ecf-c84a-4fc6-98b3-5c43415384e6', '2ab6d576-c098-402b-9025-7bcb71610b22', 'bef45247-e990-4ad5-9c32-2e8eb0611841', '60bdb5b1-fdaf-4684-85a4-77ffe05529d8'),--Google Support, userD, received_offer
  ('4e76033c-ca2f-47a6-af7b-5a7b5ae9f65c', '61588de0-230a-4c78-b4f0-8c027c882dec', '6a730847-3bed-4051-9fbf-215eddd3bcc8', 'd2c93f57-74ac-428d-b07a-eb8f6756eb7f'),--Apple ios, userA, tech_screen
  ('2827592c-4049-4b9b-bbf9-f5aacc5200c8', '2f0cea47-332d-41f4-8d41-0d164db6bea2', '70be120e-0707-4488-a980-0ce98a910817', '6144499f-d1ca-413e-a8aa-9456cc6fa344'),--Employment instructor, mike accepted_offer
  ('068779b2-f48a-4a0c-9c06-e60c7dbff483', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '6a730847-3bed-4051-9fbf-215eddd3bcc8', 'f610b0bc-f4f4-4680-951f-8a53d472865b'),--Metaverse, userA, onsite
  ('36ef49b9-af8a-4eba-8bad-c38189ba429a', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '5677146f-cae5-4d2d-acde-6ace4431186c', '38d0d734-e093-43f0-ab98-2ee6e4fd5e79'),--Metaverse, userC, rejected
  ('0ec31d1a-d0d9-4b99-a9e8-4a46cbe572f9', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '70be120e-0707-4488-a980-0ce98a910817', '42faf919-8991-4e8e-81ff-dc90dcfe59a3');--Metaverse, mike, recruiter_screen 








