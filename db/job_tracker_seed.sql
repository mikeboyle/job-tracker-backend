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

INSERT INTO roles (id, type)
VALUES
  ('ee73db2b-e98e-492b-b3a6-e427c425857c', 'free'),
  ('d04da80f-69cf-4a38-a2af-b02215492b8d', 'admin');

INSERT INTO users_roles (id, user_id, role_id)
VALUES
  ('9336f688-62ba-496b-8b58-8bec69b51fe8', '70be120e-0707-4488-a980-0ce98a910817', 'ee73db2b-e98e-492b-b3a6-e427c425857c'), --mike, free
  ('e67a4d77-0352-4930-a811-243432925869', '70be120e-0707-4488-a980-0ce98a910817', 'd04da80f-69cf-4a38-a2af-b02215492b8d'), --mike, admin
  ('c6de7c9f-b3f1-448f-920b-5eed81e3bc19', '6a730847-3bed-4051-9fbf-215eddd3bcc8', 'ee73db2b-e98e-492b-b3a6-e427c425857c'), --userA, free
  ('e3e1aee2-5a6c-4e39-8769-cd5cfd752d4a', '2e9e7434-a39d-48e9-849a-eb5809169f4c', 'ee73db2b-e98e-492b-b3a6-e427c425857c'), --userB, free
  ('159c0a65-7a10-45d1-95d3-e5a377857e24', '5677146f-cae5-4d2d-acde-6ace4431186c', 'ee73db2b-e98e-492b-b3a6-e427c425857c'), --userC, free
  ('fb6c4cb2-54ad-4ad0-8c6d-be5190251f45', 'bef45247-e990-4ad5-9c32-2e8eb0611841', 'ee73db2b-e98e-492b-b3a6-e427c425857c'); --userD, free


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
  ('6144499f-d1ca-413e-a8aa-9456cc6fa344', 'accepted_offer'),
  ('852bd0c7-77ec-4f27-b468-3e60f1b4b143', 'rejected_offer');

INSERT INTO jobs (id, company_id, description, job_status_id)
VALUES
  ('8303379e-edd5-407d-845e-b963179f9f3a', '037700c8-4578-4eaf-bdf6-843a447ceb22', 'L1 SWE', '7cd9e36e-7119-42a1-8065-018692f04914'), -- Google SWE
  ('2ab6d576-c098-402b-9025-7bcb71610b22', '037700c8-4578-4eaf-bdf6-843a447ceb22', 'Support Engineer', '4b3cbd82-2e97-4e75-8c7d-a3bbf346fbc2'), -- Google Support
  ('c25f3db2-371e-4155-bc95-d4b4994a50e0', 'e6759489-b21d-4714-b520-a530f33c7bfd', 'Engineer for Siri', '7cd9e36e-7119-42a1-8065-018692f04914'), -- Apple Siri
  ('61588de0-230a-4c78-b4f0-8c027c882dec', 'e6759489-b21d-4714-b520-a530f33c7bfd', 'ios developer', '7cd9e36e-7119-42a1-8065-018692f04914'), -- Apple ios
  ('2f0cea47-332d-41f4-8d41-0d164db6bea2', 'ce8b27c7-c9ec-484e-ab30-09a583c628fa', 'Employment instructor', '4b3cbd82-2e97-4e75-8c7d-a3bbf346fbc2'), -- Pursuit employment
  ('0da4d653-fa68-474d-b4a1-f2423d5ce1ba', 'ce8b27c7-c9ec-484e-ab30-09a583c628fa', 'Part-time tutor', '7cd9e36e-7119-42a1-8065-018692f04914'), -- Pursuit toutor
  ('f4b1ecd8-c742-4270-8b0f-5d10a3f32aa8', '6d58e2b1-c38e-4d23-ad36-f7eeae323a19', 'Site reliabilty engineer', 'b2990fc8-ddc3-4323-aa72-eb367a3a968f'), --Netflix SRE
  ('26388962-acc2-45fb-beb5-a175a480574a', '6d58e2b1-c38e-4d23-ad36-f7eeae323a19', 'Back end developer', '7b3c8491-cee3-489b-8407-66ef5ea8eae0'), --Netflix BE
  ('99b73f6e-26af-40e3-aebb-e177f1733fd1', 'e7bc6ab0-50ff-42d0-ba76-adbd43ddc7c6', 'Machine learning engineer', '7cd9e36e-7119-42a1-8065-018692f04914'), --Amazon ML
  ('e21932d5-6158-4153-ac20-aa719adeb4f8', 'e3f39560-3c4e-4acf-a863-c288be772e13', 'Metaverse explorer', '7cd9e36e-7119-42a1-8065-018692f04914'); --Meta Metaverse

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

INSERT INTO applications (id, job_id, user_id)
VALUES
  ('f94e5728-4311-40bd-8ba2-122e2beb9e5c', '8303379e-edd5-407d-845e-b963179f9f3a', '6a730847-3bed-4051-9fbf-215eddd3bcc8'),--Google SWE, userA
  ('44198feb-41a4-4049-a89c-f1637b5c60cf', '8303379e-edd5-407d-845e-b963179f9f3a', '2e9e7434-a39d-48e9-849a-eb5809169f4c'),--Google SWE, userB
  ('d9e7e287-f065-4479-acda-d9353f0a1f61', '8303379e-edd5-407d-845e-b963179f9f3a', '5677146f-cae5-4d2d-acde-6ace4431186c'),--Google SWE, userC
  ('cc331ecf-c84a-4fc6-98b3-5c43415384e6', '2ab6d576-c098-402b-9025-7bcb71610b22', 'bef45247-e990-4ad5-9c32-2e8eb0611841'),--Google Support, userD
  ('4e76033c-ca2f-47a6-af7b-5a7b5ae9f65c', '61588de0-230a-4c78-b4f0-8c027c882dec', '6a730847-3bed-4051-9fbf-215eddd3bcc8'),--Apple ios, userA
  ('068779b2-f48a-4a0c-9c06-e60c7dbff483', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '6a730847-3bed-4051-9fbf-215eddd3bcc8'),--Metaverse, userA
  ('36ef49b9-af8a-4eba-8bad-c38189ba429a', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '5677146f-cae5-4d2d-acde-6ace4431186c'),--Metaverse, userC
  ('0ec31d1a-d0d9-4b99-a9e8-4a46cbe572f9', 'e21932d5-6158-4153-ac20-aa719adeb4f8', '70be120e-0707-4488-a980-0ce98a910817'), --Metaverse, mike
  ('2827592c-4049-4b9b-bbf9-f5aacc5200c8', '2f0cea47-332d-41f4-8d41-0d164db6bea2', '70be120e-0707-4488-a980-0ce98a910817'), --Employment instructor, mike
  ('508c1b59-22c9-4b21-bd33-08883f32969e', '2ab6d576-c098-402b-9025-7bcb71610b22', '70be120e-0707-4488-a980-0ce98a910817'); --Google Support, mike

INSERT INTO application_status_changes (id, application_id, old_status_id, new_status_id, created_at)
  VALUES
('84d1c71b-2bcb-4397-8109-94435445e980', 'f94e5728-4311-40bd-8ba2-122e2beb9e5c', NULL, 'ffb2727a-f2cb-4602-98c0-2db09be7c355', CURRENT_TIMESTAMP), --Google SWE, userA, not_started, now
('13a89425-478b-4150-80b4-02741d65ded5', '44198feb-41a4-4049-a89c-f1637b5c60cf', NULL, 'a42da525-33a5-4961-baa1-79c06cd0a173', CURRENT_TIMESTAMP), --Google SWE, userB, started, now
('744fe4ce-d146-45f5-9f00-51c606e3aa4c', 'd9e7e287-f065-4479-acda-d9353f0a1f61', NULL, 'bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6', CURRENT_TIMESTAMP), --Google SWE, userC, submitted, now
('513e1370-c8f9-48fe-b526-dd1abb502167', 'cc331ecf-c84a-4fc6-98b3-5c43415384e6', NULL, '60bdb5b1-fdaf-4684-85a4-77ffe05529d8', CURRENT_TIMESTAMP), --Google Support, userD, received_offer, now
('30fba597-a624-44b3-a05f-1299dced4912', '4e76033c-ca2f-47a6-af7b-5a7b5ae9f65c', NULL, 'd2c93f57-74ac-428d-b07a-eb8f6756eb7f', CURRENT_TIMESTAMP), --Apple ios, userA, tech_screen, now
('79497822-8b33-4a0e-abd6-4df062e66459', '068779b2-f48a-4a0c-9c06-e60c7dbff483', NULL, 'f610b0bc-f4f4-4680-951f-8a53d472865b', CURRENT_TIMESTAMP), --Metaverse, userA, onsite, now
('4b9e66db-a06a-4866-a049-909b8a443e1b', '36ef49b9-af8a-4eba-8bad-c38189ba429a', NULL, '38d0d734-e093-43f0-ab98-2ee6e4fd5e79', CURRENT_TIMESTAMP), --Metaverse, userC, rejected, now
('48c0a8cb-646c-45b3-b956-8ae6c52400e8', '0ec31d1a-d0d9-4b99-a9e8-4a46cbe572f9', NULL, '42faf919-8991-4e8e-81ff-dc90dcfe59a3', CURRENT_TIMESTAMP), --Metaverse, mike, recruiter_screen, now
('cde01001-80df-4241-af89-dacc9e1f58cf', '2827592c-4049-4b9b-bbf9-f5aacc5200c8', NULL, 'bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6', CURRENT_TIMESTAMP - INTERVAL '30 days'), --Employment instructor, mike, submitted, now - 30 days
('e16ced28-1531-4eb0-96a0-a334ba05fed1', '2827592c-4049-4b9b-bbf9-f5aacc5200c8', 'bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6', 'd2c93f57-74ac-428d-b07a-eb8f6756eb7f', CURRENT_TIMESTAMP - INTERVAL '14 days'), --Employment instructor, mike, tech_screen, now - 14 days
('614e9a18-d4c2-4fa6-a5c3-942f8bcf2602', '2827592c-4049-4b9b-bbf9-f5aacc5200c8', 'd2c93f57-74ac-428d-b07a-eb8f6756eb7f', 'f610b0bc-f4f4-4680-951f-8a53d472865b', CURRENT_TIMESTAMP - INTERVAL '7 days'), --Employment instructor, mike, onsite, now - 7 days
('5329c4ad-2fb1-44b3-96f5-b8d315c75ed3', '2827592c-4049-4b9b-bbf9-f5aacc5200c8', 'f610b0bc-f4f4-4680-951f-8a53d472865b', '60bdb5b1-fdaf-4684-85a4-77ffe05529d8', CURRENT_TIMESTAMP - INTERVAL '3 days'), --Employment instructor, mike, received_offer, now - 3 days
('75da3a95-c73e-430e-86f1-97ab057784e6', '2827592c-4049-4b9b-bbf9-f5aacc5200c8', '60bdb5b1-fdaf-4684-85a4-77ffe05529d8', '6144499f-d1ca-413e-a8aa-9456cc6fa344', CURRENT_TIMESTAMP), --Employment instructor, mike, accepted_offer, now
('17a936b3-377e-4148-9166-71ba95d57be9', '508c1b59-22c9-4b21-bd33-08883f32969e', NULL, 'ffb2727a-f2cb-4602-98c0-2db09be7c355', CURRENT_TIMESTAMP - INTERVAL '10 days'), --Google Support, mike, not started, now - 10 days
('fb3624d9-a04b-4dfa-bdc3-ea7383d084bf', '508c1b59-22c9-4b21-bd33-08883f32969e', 'ffb2727a-f2cb-4602-98c0-2db09be7c355', 'bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6', CURRENT_TIMESTAMP - INTERVAL '9 days'), --Google Support, mike, submitted, now - 9 days
('0a690f8d-a28d-4ecb-a2e9-e81b7b112172', '508c1b59-22c9-4b21-bd33-08883f32969e', 'bc1fc4d5-3c8f-44b2-886a-249a6fd0c2c6', 'd2c93f57-74ac-428d-b07a-eb8f6756eb7f', CURRENT_TIMESTAMP - INTERVAL '4 days'), --Google Support, mike, tech_screen, now - 4 days
('f6ae5f8d-ef35-496b-a0c7-f772c4a6e091', '508c1b59-22c9-4b21-bd33-08883f32969e', 'd2c93f57-74ac-428d-b07a-eb8f6756eb7f', '38d0d734-e093-43f0-ab98-2ee6e4fd5e79', CURRENT_TIMESTAMP); --Google Support, mike, rejected, now